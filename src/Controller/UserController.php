<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\UserType;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class UserController extends AbstractController
{
    /**
     * @Route("/", name="user")
     */
    public function index(UserRepository $userRepository)
    {
        return $this->render('user/index.html.twig', [
        	'users' => $userRepository->findAll()
        ]);
    }

    /**
     * @Route("/connexion", name="user_login")
     */
    public function login() {

        return $this->render('user/login.html.twig', [
            "template_name" => "Connexion"
        ]);
    }

    /**
     * @Route("/inscription", name="user_register")
     */
    public function create(Request $request, ObjectManager $manager, UserPasswordEncoderInterface $encoder, \Swift_Mailer $mailer) {
        $user = new User();
        
        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()) {
            $hash = $encoder->encodePassword($user, $user->getPassword());
            $user->setPassword($hash);
            $user->setRoles(["ROLE_UNDEFINED"]);
       		$randomToken = bin2hex(random_bytes(112));
    		$user->setToken($randomToken);
            $manager->persist($user);
            $manager->flush();

            $message = (new \Swift_Message('Bienvenue sur MyQuizz !'))
                ->setFrom("admin@my-quizz.com")
                ->setTo($user->getEmail())
                ->setBody(
                    $this->renderView(
                        'emails/registration.html.twig',
                        array(
                        	'id' => $user->getId(),
                        	'name' => $user->getUsername()
                    	)
                    ),
                    'text/html'
                );

            $mailer->send($message);
            return $this->redirectToRoute('user_login');
        }

        return $this->render('user/registration.html.twig', [
            'template_name' => 'Inscription',
            'form' => $form->createView()
        ]);
    }


    /**
     * @Route("/verify-mail/", name="user_reSend")
     */
    public function reSendMail(\Swift_Mailer $mailer)
    {
        $message = (new \Swift_Message('Bienvenue sur MyQuizz !'))
        ->setFrom("admin@my-quizz.com")
        ->setTo($this->getUser()->getEmail())
        ->setBody(
            $this->renderView(
                'emails/registration.html.twig',
                    array(
                    	'id' => $this->getUser()->getId(),
                        'name' => $this->getUser()->getUsername()
                    )
                ),
                'text/html'
            );

        $mailer->send($message);

        return $this->redirectToRoute('user');        
    }

	/**
     * @Route("/validation/{id}", name="user_token")
     */
    public function validUser(Request $request, User $user, ObjectManager $manager)
    {
    	$user->setRoles(["ROLE_USER"]);
        $manager->persist($user);
        $manager->flush();

        return $this->redirectToRoute('user_logout');
    }

    /**
     * @Route("/logout", name="user_logout")
     */
    public function logout() {}


    /**
     * @Route("/edit/{id}", name="user_edit")
     */
    public function edit(Request $request, User $user, UserPasswordEncoderInterface $encoder, \Swift_Mailer $mailer)
    {
        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $hash = $encoder->encodePassword($user, $user->getPassword());
            $user->setPassword($hash);
            $user->setRoles(['ROLE_UNDEFINED']);            
            $this->getDoctrine()->getManager()->flush();

            $message = (new \Swift_Message('Changement de mail !'))
                ->setFrom("admin@my-quizz.com")
                ->setTo($user->getEmail())
                ->setBody(
                    $this->renderView(
                        'emails/newMail.html.twig',
                        array(
                            'id' => $this->getUser()->getId(),
                            'name' => $user->getUsername()
                        )
                    ),
                    'text/html'
                );

            $mailer->send($message);

            return $this->redirectToRoute('user_logout', ['id' => $user->getId()]);
        }

        return $this->render('user/edit.html.twig', [
            'user' => $user,
            'form' => $form->createView(),
            'template_name' => "Editer profil"
        ]);
    }

    /**
     * @Route("/{id}", name="user_delete")
     */
    public function delete(Request $request, User $user)
    {
        if ($this->isCsrfTokenValid('delete'.$user->getId(), $request->request->get('_token'))) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($user);
            $em->flush();
            $this->get('security.token_storage')->setToken(null);
            $request->getSession()->invalidate();
        }
        return $this->redirectToRoute('user_logout');
    }
}

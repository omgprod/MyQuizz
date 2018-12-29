<?php

namespace App\Controller;

use App\Entity\User;
use App\Entity\Categories;
use App\Form\UserType;
use App\Form\CategoriesType;
use App\Form\AdminEditType;
use App\Repository\UserRepository;
use App\Repository\CategoriesRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class AdminController extends AbstractController
{
    /**
     * @Route("/admin", name="admin")
     */
    public function index()
    {
        return $this->render('admin/index.html.twig', [
        	'template_name' => 'Admin Index'
        ]);
    }

    /**
     * @Route("/admin/categories", name="admin_categories")
     */
    public function indexCategories(CategoriesRepository $categoriesRepository)
    {
        return $this->render('admin/categories/index.html.twig', [
        	'template_name' => 'Admin Catégories',
        	'categories' => $categoriesRepository->findAll()]);
    }

    /**
     * @Route("/admin/user", name="admin_users")
     */
    public function indexUser(UserRepository $userRepository)
    { 
        return $this->render('admin/user/index.html.twig', [
        	'template_name' => 'Admin User',
        	'users' => $userRepository->findAll(),
        ]);
    }

    /**
     * @Route("/admin/categories/create", name="admin_categories_create")
     */
    public function createCategories(Request $request)
    {
        $category = new Categories();
        $form = $this->createForm(CategoriesType::class, $category);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($category);
            $em->flush();

            return $this->redirectToRoute('admin_categories');
        }

        return $this->render('admin/categories/create.html.twig', [
        	'template_name' => 'Create Catégorie',
            'category' => $category,
            'form' => $form->createView()
        ]);
    }

    /**
     * @Route("/admin/users/create", name="admin_users_create")
     */
    public function createUsers(Request $request, UserPasswordEncoderInterface $encoder)
    {
        $user = new User();
        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $hash = $encoder->encodePassword($user, $user->getPassword());
            $user->setPassword($hash);
            $user->setRoles(["ROLE_USER"]);
            $randomToken = bin2hex(random_bytes(112));
            $user->setToken($randomToken);            
            $em->persist($user);
            $em->flush();

            return $this->redirectToRoute('admin_users');
        }

        return $this->render('admin/user/create.html.twig', [
        	'template_name' => 'Create Users',        	
            'user' => $user,
            'form' => $form->createView()
        ]);
    }

    /**
     * @Route("/admin/categories/{id}/edit", name="admin_categories_edit")
     */
    public function editCategories(Request $request, Categories $category)
    {
        $form = $this->createForm(CategoriesType::class, $category);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();


            return $this->redirectToRoute('admin_categories', ['id' => $category->getId()]);
        }

        return $this->render('admin/categories/edit.html.twig', [
        	'template_name' => 'Catégorie Edit',
            'category' => $category,
            'form' => $form->createView() 
        ]);
    }

    /**
     * @Route("/admin/users/{id}/edit", name="admin_users_edit")
     */
    public function editUsers(Request $request, User $user, UserPasswordEncoderInterface $encoder, \Swift_Mailer $mailer)
    {
        $form = $this->createForm(AdminEditType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $hash = $encoder->encodePassword($user, $user->getPassword());
            $user->setPassword($hash);
            $user->setRoles(['ROLE_UNDEFINED']);
            $this->getDoctrine()->getManager()->flush();

            $message = (new \Swift_Message('Changement de mail - MyQuizz !'))
                ->setFrom('admin@my-quizz.com')
                ->setTo($user->getEmail())
                ->setBody(
                    $this->renderView(
                        'emails/newMail.html.twig',
                        array(
                            'id' => $user->getId(),
                            'name' => $user->getUsername()
                        )
                    ),
                    'text/html'
                );

            $mailer->send($message);

            return $this->redirectToRoute('admin_users', ['id' => $user->getId()]);
        }

        return $this->render('admin/user/edit.html.twig', [
        	'template_name' => 'User Edit',
            'user' => $user,
            'form' => $form->createView()
        ]);
    }

    /**
     * @Route("/admin/categories/{id}/delete", name="admin_categories_delete")
     */
    public function categoryDelete(Request $request, Categories $category)
    {
        if ($this->isCsrfTokenValid('delete'.$category->getId(), $request->request->get('_token'))) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($category);
            $em->flush();
        }

        return $this->redirectToRoute('admin_categories');
    }

    /**
     * @Route("/admin/users/{id}/delete", name="admin_users_delete" )
     */
    public function UserDelete(Request $request, User $user)
    {
        if ($this->isCsrfTokenValid('delete'.$user->getId(), $request->request->get('_token'))) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($user);
            $em->flush();
        }
        return $this->redirectToRoute('admin_users');
    }

    /**
     * @Route("/admin/contact", name="admin_contact" )
     */
    public function contact(Request $request, UserRepository $userRepository, \Swift_Mailer $mailer)
    {
        $test = $userRepository->findAll();
        $counting = count($test);
        $globalMail = $request->get('globalMail');

        if(isset($globalMail)) {
            for($i = 0; $i < $counting; $i++) {
                $message = (new \Swift_Message('MyQuizz'))
                    ->setFrom("admin@my-quizz.com")
                    ->setTo($test[$i]->getEmail())
                    ->setBody(
                        $this->renderView(
                            'emails/contact.html.twig'
                        ),
                        'text/html'
                    );
                $mailer->send($message);
            }
        }


        return $this->render('admin/contact.html.twig', [
            'template_name' => 'Contact Form'
        ]);
    }        
}

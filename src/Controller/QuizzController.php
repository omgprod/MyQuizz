<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

use Symfony\Component\HttpFoundation\Request;
use Doctrine\Common\Persistence\ObjectManager;

use App\Repository\QuizzRepository;
use App\Repository\QuestionsRepository;
use App\Repository\ReponsesRepository;
use App\Repository\ResultsRepository;

use App\Entity\User;
use App\Entity\Quizz;
use App\Entity\Questions;
use App\Entity\Results;

use App\Form\QuizzType;

class QuizzController extends AbstractController
{
    /**
     * @Route("/quizz", name="quizz")
     */
    public function index(QuizzRepository $repo) {

        $quizzs = $repo->findAll();

        return $this->render('quizz/index.html.twig',  [
            "template_name" => "Choisir un quizz",
            "quizzs" => $quizzs
        ]);
    }

    /**
     * @Route("/quizz/creer_un_quizz", name="quizz_create")
     */
    public function create(Request $request, ObjectManager $manager) {
        $quizz = new Quizz();

        $form = $this->createForm(QuizzType::class, $quizz);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()) {
            $manager->persist($quizz);
            $manager->flush();
        }

        return $this->render('quizz/create.html.twig', [
            'template_name' => 'Créer un Quizz',
            'form' => $form->createView()
        ]);
    }

    /**
     * @Route("/quizz/{id}", name="quizz_show")
     */
    public function show(Request $request, ObjectManager $manager, ResultsRepository $resultsRepo, Quizz $quizz, ReponsesRepository $reponse, $id) {
        $inputReponse = $request->get('getAnswer');
        $count = $request->get('count');
        $score = $request->get('score');
        $totalQuestion = count($quizz->getQuestions());
        $message = "";
        $saveResults = $request->get('saveResults');

        if(!isset($count)){
            $count = 0;
        } else {
            $count += 0.5;
        }
        
        $i = floor($count+1);

        if(!isset($score)){
            $score = 0;
        }

        if(isset($inputReponse)) {
            $reponse = $reponse->findAll();
            $inputReponse--;
            $reponse = $reponse[$inputReponse]->getReponseExpected();
            if($reponse == true) {
                $message = "Bonne réponse ✔";
                $score++;
            } else {
                $message = "Mauvaise réponse ✘";
            }
        }

        if($count == $totalQuestion){
            if($this->getUser() != null) {
            	$results = new results();
            	$results->setScore($score);
            	$results->setCreatedAt(new \DateTime());
            	$results->setQuizz($quizz);
            	$results->setUser($this->getUser());
            	$manager->persist($results);
            	$manager->flush();
            }
                 
            return $this->render('quizz/score.html.twig', [
                "template_name" => "Résultat du quizz",
                "score" => $score
            ]);
        }

        return $this->render('quizz/show.html.twig', [
            "template_name" => "Quizz Harry Potter" ,
            "quizz" => $quizz,
            "inputReponse" => $inputReponse,
            "message" => $message,
            "count" => $count,
            "score" => $score,
            "totalQuestion" => $totalQuestion,
            "i" => $i
        ]);
    }
}

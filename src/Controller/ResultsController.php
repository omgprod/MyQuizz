<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Results;
use App\Repository\ResultsRepository;

class ResultsController extends AbstractController
{
    /**
     * @Route("/historique", name="results")
     */
    public function index(ResultsRepository $resultsRepository)
    {

        return $this->render('results/index.html.twig', [
            'template_name' => 'Historique des parties',
            'results' => $resultsRepository->findAll()
        ]);
    }
}

<?php

namespace App\DataFixtures;

use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class UserFixtures extends Fixture
{
	private $passwordEncoder;

	public function __construct(UserPasswordEncoderInterface $passwordEncoder)
	{
	    $this->passwordEncoder = $passwordEncoder;
	}

	public function load(ObjectManager $manager)
	{	
	    $admin = new User();
	    $admin->setUsername('Yunshu');
	    $admin->setEmail('Yunshu@Yunshu.Yunshu');
		$admin->setPassword($this->passwordEncoder->encodePassword($admin,'Yunshu'));
	    $admin->setRoles(array('ROLE_ADMIN'));
	    $manager->persist($admin);

	    $manager->flush();
	}
}

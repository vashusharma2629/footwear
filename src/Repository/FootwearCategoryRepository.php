<?php

namespace App\Repository;

use App\Entity\FootwearCategory;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method FootwearCategory|null find($id, $lockMode = null, $lockVersion = null)
 * @method FootwearCategory|null findOneBy(array $criteria, array $orderBy = null)
 * @method FootwearCategory[]    findAll()
 * @method FootwearCategory[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class FootwearCategoryRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, FootwearCategory::class);
    }

    // /**
    //  * @return FootwearCategory[] Returns an array of FootwearCategory objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('f')
            ->andWhere('f.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('f.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?FootwearCategory
    {
        return $this->createQueryBuilder('f')
            ->andWhere('f.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}

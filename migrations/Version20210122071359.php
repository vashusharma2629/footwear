<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210122071359 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE footwear_product ADD sole_type ENUM(\'\',\'RUBBER\', \'CAMP\' , \'CORK\'), ADD lace_type ENUM(\'\',\'COTTON\', \'NYLON\' , \'ELASTIC\'), ADD made_in ENUM(\'INDIA\', \'AMERICA\' , \'GEORGIA\', \'OTHERS\'), CHANGE section section ENUM(\'male\', \'female\' , \'kids\'), CHANGE durability durability ENUM(\'HIGH\', \'MEDIUM\' , \'LOW\'), CHANGE ease_to_wear ease_to_wear ENUM(\'EASY\', \'MEDIUM\' , \'DIFFICULT\'), CHANGE occasion occasion ENUM(\'PARTY WEAR\', \'CASUAL WEAR\' , \'OFFICE WEAR\'), CHANGE rating rating ENUM(\'3 STAR\', \'4 STAR\' , \'5 STAR\')');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE footwear_product DROP sole_type, DROP lace_type, DROP made_in, CHANGE section section VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT NULL COLLATE `utf8mb4_unicode_ci`, CHANGE durability durability VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT NULL COLLATE `utf8mb4_unicode_ci`, CHANGE ease_to_wear ease_to_wear VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT NULL COLLATE `utf8mb4_unicode_ci`, CHANGE occasion occasion VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT NULL COLLATE `utf8mb4_unicode_ci`, CHANGE rating rating VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT NULL COLLATE `utf8mb4_unicode_ci`');
    }
}

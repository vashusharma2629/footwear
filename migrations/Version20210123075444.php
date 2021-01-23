<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210123075444 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE footwear_product CHANGE section section ENUM(\'male\', \'female\' , \'kids\'), CHANGE durability durability ENUM(\'HIGH\', \'MEDIUM\' , \'LOW\'), CHANGE ease_to_wear ease_to_wear ENUM(\'EASY\', \'MEDIUM\' , \'DIFFICULT\'), CHANGE occasion occasion ENUM(\'PARTY WEAR\', \'CASUAL WEAR\' , \'OFFICE WEAR\'), CHANGE rating rating ENUM(\'3 STAR\', \'4 STAR\' , \'5 STAR\'), CHANGE sole_type sole_type ENUM(\'\',\'RUBBER\', \'CAMP\' , \'CORK\'), CHANGE lace_type lace_type ENUM(\'\',\'COTTON\', \'NYLON\' , \'ELASTIC\'), CHANGE made_in made_in ENUM(\'INDIA\', \'AMERICA\' , \'GEORGIA\', \'OTHERS\'), CHANGE status status ENUM(\'NEW\', \'REVIEW\' , \'PUBLISHED\')');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE footwear_product CHANGE section section VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT NULL COLLATE `utf8mb4_unicode_ci`, CHANGE durability durability VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT NULL COLLATE `utf8mb4_unicode_ci`, CHANGE ease_to_wear ease_to_wear VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT NULL COLLATE `utf8mb4_unicode_ci`, CHANGE sole_type sole_type VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT NULL COLLATE `utf8mb4_unicode_ci`, CHANGE lace_type lace_type VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT NULL COLLATE `utf8mb4_unicode_ci`, CHANGE status status VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT NULL COLLATE `utf8mb4_unicode_ci`, CHANGE occasion occasion VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT NULL COLLATE `utf8mb4_unicode_ci`, CHANGE made_in made_in VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT NULL COLLATE `utf8mb4_unicode_ci`, CHANGE rating rating VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT NULL COLLATE `utf8mb4_unicode_ci`');
    }
}

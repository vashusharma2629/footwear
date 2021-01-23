<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210121094417 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE footwear_product ADD durability ENUM(\'HIGH\', \'MEDIUM\' , \'LOW\'), ADD ease_to_wear ENUM(\'EASY\', \'MEDIUM\' , \'DIFFICULT\'), ADD sole_type ENUM(\'RUBBER\', \'CAMP\' , \'CORK\'), ADD lace_type ENUM(\'COTTON\', \'NYLON\' , \'ELASTIC\'), ADD material VARCHAR(255) NOT NULL, ADD short_description LONGTEXT NOT NULL, ADD detailed_description LONGTEXT NOT NULL, ADD quantity_in_stock INT NOT NULL, ADD market_price DOUBLE PRECISION DEFAULT NULL, ADD discount DOUBLE PRECISION DEFAULT NULL, ADD selling_price DOUBLE PRECISION NOT NULL, ADD weight DOUBLE PRECISION NOT NULL, ADD occasion ENUM(\'PARTY WEAR\', \'CASUAL WEAR\' , \'OFFICE WEAR\'), ADD made_in ENUM(\'INDIA\', \'AMERICA\' , \'GEORGIA\'), ADD rating ENUM(\'3 STAR\', \'4 STAR\' , \'5 STAR\'), ADD attribute1 VARCHAR(255) DEFAULT NULL, CHANGE section section ENUM(\'male\', \'female\' , \'kids\')');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE footwear_product DROP durability, DROP ease_to_wear, DROP sole_type, DROP lace_type, DROP material, DROP short_description, DROP detailed_description, DROP quantity_in_stock, DROP market_price, DROP discount, DROP selling_price, DROP weight, DROP occasion, DROP made_in, DROP rating, DROP attribute1, CHANGE section section VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT NULL COLLATE `utf8mb4_unicode_ci`');
    }
}

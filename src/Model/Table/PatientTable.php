<?php
declare(strict_types=1);

namespace App\Model\Table;

use Cake\ORM\Query\SelectQuery;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

/**
 * Patient Model
 *
 * @method \App\Model\Entity\Patient newEmptyEntity()
 * @method \App\Model\Entity\Patient newEntity(array $data, array $options = [])
 * @method array<\App\Model\Entity\Patient> newEntities(array $data, array $options = [])
 * @method \App\Model\Entity\Patient get(mixed $primaryKey, array|string $finder = 'all', \Psr\SimpleCache\CacheInterface|string|null $cache = null, \Closure|string|null $cacheKey = null, mixed ...$args)
 * @method \App\Model\Entity\Patient findOrCreate($search, ?callable $callback = null, array $options = [])
 * @method \App\Model\Entity\Patient patchEntity(\Cake\Datasource\EntityInterface $entity, array $data, array $options = [])
 * @method array<\App\Model\Entity\Patient> patchEntities(iterable $entities, array $data, array $options = [])
 * @method \App\Model\Entity\Patient|false save(\Cake\Datasource\EntityInterface $entity, array $options = [])
 * @method \App\Model\Entity\Patient saveOrFail(\Cake\Datasource\EntityInterface $entity, array $options = [])
 * @method iterable<\App\Model\Entity\Patient>|\Cake\Datasource\ResultSetInterface<\App\Model\Entity\Patient>|false saveMany(iterable $entities, array $options = [])
 * @method iterable<\App\Model\Entity\Patient>|\Cake\Datasource\ResultSetInterface<\App\Model\Entity\Patient> saveManyOrFail(iterable $entities, array $options = [])
 * @method iterable<\App\Model\Entity\Patient>|\Cake\Datasource\ResultSetInterface<\App\Model\Entity\Patient>|false deleteMany(iterable $entities, array $options = [])
 * @method iterable<\App\Model\Entity\Patient>|\Cake\Datasource\ResultSetInterface<\App\Model\Entity\Patient> deleteManyOrFail(iterable $entities, array $options = [])
 *
 * @mixin \Cake\ORM\Behavior\TimestampBehavior
 */
class PatientTable extends Table
{
    /**
     * Initialize method
     *
     * @param array<string, mixed> $config The configuration for the Table.
     * @return void
     */
    // Replace your existing initialize() function with this one

public function initialize(array $config): void
    {
        parent::initialize($config);

        $this->setTable('patient');
        $this->setDisplayField('patient_fullname');
        $this->setPrimaryKey('patient_id');

        $this->addBehavior('Timestamp');
        $this->addBehavior('AuditStash.AuditLog');
        $this->addBehavior('Search.Search');

        // THIS CORRECTLY CONFIGURES THE SEARCH
        $this->searchManager()
            ->add('id', 'Search.Value', [
                'fields' => $this->aliasField('patient_id')
            ]);
    }

    /**
     * Default validation rules.
     *
     * @param \Cake\Validation\Validator $validator Validator instance.
     * @return \Cake\Validation\Validator
     */
    public function validationDefault(Validator $validator): Validator
    {
        $validator
            ->scalar('patient_fullname')
            ->maxLength('patient_fullname', 255)
            ->requirePresence('patient_fullname', 'create')
            ->notEmptyString('patient_fullname');

        $validator
            ->scalar('patient_ic')
            ->maxLength('patient_ic', 255)
            ->requirePresence('patient_ic', 'create')
            ->notEmptyString('patient_ic');

        $validator
            ->scalar('patient_gender')
            ->maxLength('patient_gender', 10)
            ->requirePresence('patient_gender', 'create')
            ->notEmptyString('patient_gender');

        $validator
            ->scalar('patient_phone')
            ->maxLength('patient_phone', 50)
            ->requirePresence('patient_phone', 'create')
            ->notEmptyString('patient_phone');

        $validator
            ->scalar('patient_email')
            ->maxLength('patient_email', 50)
            ->requirePresence('patient_email', 'create')
            ->notEmptyString('patient_email');

        $validator
            ->scalar('patient_address_line1')
            ->maxLength('patient_address_line1', 255)
            ->requirePresence('patient_address_line1', 'create')
            ->notEmptyString('patient_address_line1');

        $validator
            ->scalar('patient_address_line2')
            ->maxLength('patient_address_line2', 255)
            ->requirePresence('patient_address_line2', 'create')
            ->notEmptyString('patient_address_line2');

        $validator
            ->scalar('poscode')
            ->maxLength('poscode', 10)
            ->requirePresence('poscode', 'create')
            ->notEmptyString('poscode');

        $validator
            ->scalar('city')
            ->maxLength('city', 50)
            ->requirePresence('city', 'create')
            ->notEmptyString('city');

        $validator
            ->scalar('state')
            ->maxLength('state', 50)
            ->requirePresence('state', 'create')
            ->notEmptyString('state');

        $validator
            ->scalar('status')
            ->requirePresence('status', 'create')
            ->notEmptyString('status');

        return $validator;
    }
}

<?php
declare(strict_types=1);

namespace App\Model\Table;

use Cake\ORM\Query\SelectQuery;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

/**
 * Dentist Model
 *
 * @method \App\Model\Entity\Dentist newEmptyEntity()
 * @method \App\Model\Entity\Dentist newEntity(array $data, array $options = [])
 * @method array<\App\Model\Entity\Dentist> newEntities(array $data, array $options = [])
 * @method \App\Model\Entity\Dentist get(mixed $primaryKey, array|string $finder = 'all', \Psr\SimpleCache\CacheInterface|string|null $cache = null, \Closure|string|null $cacheKey = null, mixed ...$args)
 * @method \App\Model\Entity\Dentist findOrCreate($search, ?callable $callback = null, array $options = [])
 * @method \App\Model\Entity\Dentist patchEntity(\Cake\Datasource\EntityInterface $entity, array $data, array $options = [])
 * @method array<\App\Model\Entity\Dentist> patchEntities(iterable $entities, array $data, array $options = [])
 * @method \App\Model\Entity\Dentist|false save(\Cake\Datasource\EntityInterface $entity, array $options = [])
 * @method \App\Model\Entity\Dentist saveOrFail(\Cake\Datasource\EntityInterface $entity, array $options = [])
 * @method iterable<\App\Model\Entity\Dentist>|\Cake\Datasource\ResultSetInterface<\App\Model\Entity\Dentist>|false saveMany(iterable $entities, array $options = [])
 * @method iterable<\App\Model\Entity\Dentist>|\Cake\Datasource\ResultSetInterface<\App\Model\Entity\Dentist> saveManyOrFail(iterable $entities, array $options = [])
 * @method iterable<\App\Model\Entity\Dentist>|\Cake\Datasource\ResultSetInterface<\App\Model\Entity\Dentist>|false deleteMany(iterable $entities, array $options = [])
 * @method iterable<\App\Model\Entity\Dentist>|\Cake\Datasource\ResultSetInterface<\App\Model\Entity\Dentist> deleteManyOrFail(iterable $entities, array $options = [])
 *
 * @mixin \Cake\ORM\Behavior\TimestampBehavior
 */
class DentistTable extends Table
{
    /**
     * Initialize method
     *
     * @param array<string, mixed> $config The configuration for the Table.
     * @return void
     */
    public function initialize(array $config): void
    {
        parent::initialize($config);

        $this->setTable('dentist');
        $this->setDisplayField('dentist_fullname');
        $this->setPrimaryKey('dentist_id');

        $this->addBehavior('Timestamp');
		$this->addBehavior('AuditStash.AuditLog');
		$this->addBehavior('Search.Search');
		$this->searchManager()
			->value('id')
				->add('search', 'Search.Like', [
					//'before' => true,
					//'after' => true,
					'fieldMode' => 'OR',
					'multiValue' => true,
					'multiValueSeparator' => '|',
					'comparison' => 'LIKE',
					'wildcardAny' => '*',
					'wildcardOne' => '?',
					'fields' => ['id'],
				]);
    }

    /**
     * Default validation rules.
     *
     * @param \Cake\Validation\Validator $validator Validator instance.
     * @return \Cake\Validation\Validator
     */
    // Replace your existing validationDefault() function with this corrected version.

public function validationDefault(Validator $validator): Validator
{
    $validator
        ->scalar('dentist_fullname')
        ->maxLength('dentist_fullname', 255)
        ->requirePresence('dentist_fullname', 'create')
        ->notEmptyString('dentist_fullname');

    $validator
        ->scalar('dentist_gender')
        ->maxLength('dentist_gender', 10)
        ->requirePresence('dentist_gender', 'create')
        ->notEmptyString('dentist_gender');

    $validator
        ->scalar('dentist_phone')
        ->maxLength('dentist_phone', 50)
        ->requirePresence('dentist_phone', 'create')
        ->notEmptyString('dentist_phone');

    $validator
        ->scalar('dentist_email')
        ->maxLength('dentist_email', 255)
        ->requirePresence('dentist_email', 'create')
        ->notEmptyString('dentist_email');

   

    $validator
        ->scalar('status')
        ->requirePresence('status', 'create')
        ->notEmptyString('status');

    return $validator;
}
}

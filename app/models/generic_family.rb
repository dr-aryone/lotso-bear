class GenericFamily < ActiveRecord::Base

  has_many :spare_likelihoods
  has_many :generic_spares, through: :spare_likelihoods
  has_many :stock_families

  has_many :type_likelihoods
  has_many :car_types, through: :type_likelihoods


  accepts_nested_attributes_for :spare_likelihoods

  validates :name, presence: :true
  validates :code, presence: :true

  def self.not_assigned_families
    where.not(:id  => TypeLikelihood.select(:generic_family_id) )
  end

  def clone
    clone = self.dup
    clone.save
    self.generic_spares.each {|spare| clone.generic_spares << spare.dup}
    clone.save
    clone
  end

  def self.assigned_families
    where(:id  => TypeLikelihood.select(:generic_family_id) )
  end

  def self.other_families(generic_car)
    if generic_car.car_type.generic_families.empty?
      all
    else
      where('id not in (?)', generic_car.car_type.generic_families.pluck(:id))
    end
  end

end

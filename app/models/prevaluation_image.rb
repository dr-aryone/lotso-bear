# -*- encoding : utf-8 -*-
class PrevaluationImage < ActiveRecord::Base
  belongs_to :prevaluation, dependent: :destroy

  has_attached_file :image, :styles => { :medium => "500x500>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end

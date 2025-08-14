# == Schema Information
#
# Table name: material_attachments
#
#  id              :bigint           not null, primary key
#  material_id     :bigint           not null
#  media_id        :bigint           not null
#  attachment_type :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class MaterialAttachment < ApplicationRecord
  belongs_to :material, class_name: "LearningMaterial"
  belongs_to :media, class_name: "MediaLibrary"
end

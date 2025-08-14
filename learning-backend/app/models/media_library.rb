class MediaLibrary < ApplicationRecord
  belongs_to :uploaded_by, class_name: "User"
  has_many :material_attachments
  has_many :learning_materials, through: :material_attachments
end

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
require "test_helper"

class MaterialAttachmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: lists
#
#  id         :bigint           not null, primary key
#  video_id   :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class List < ApplicationRecord
    validates :video_id, uniqueness: {scope: :user_id}

    belongs_to :video,
    primary_key: :id,
    foreign_key: :video_id,
    class_name: :Video

    belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
end

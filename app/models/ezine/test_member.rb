class Ezine::TestMember
  include SS::Document
  include SS::Reference::User
  include SS::Reference::Site
  include Cms::Permission
  include Ezine::MemberSearchable

  field :email, type: String, metadata: { from: :email }
  field :email_type, type: String

  permit_params :email, :email_type

  belongs_to :node, class_name: "Cms::Node"

  validates :email, uniqueness: { scope: :node_id }, presence: true, email: true

  # Test member is always "enabled".
  scope :enabled, ->{ all }

  public
    def email_type_options
      [%w(テキスト版 text), %w(HTML版 html)]
    end

    def test_member?
      true
    end
end
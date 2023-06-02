class User < ApplicationRecord
  alias_attribute :issued_at, :access_token_issued_at
end

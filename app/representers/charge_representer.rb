class ChargeRepresenter
  def initialize(charges)
    @charges = charges
  end

  def as_json
    charges.map do |charge|
      {
        id: charge.id,
        title: charge.title,
        accusee: charge.accusee,
        collection_date: charge.collection_date,
        charges: charge.charges,
        created_at: charge.created_at,
        updated_at: charge.updated_at,
        image: post.imageUrl
      }
    end
  end

  private
  
  attr_reader :charges
end

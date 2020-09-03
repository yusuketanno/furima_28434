class ItemssTag

  include ActiveModel::Model
  attr_accessor :message, :name

  with_options presence: true do
    validates :message
    validates :name
  end

  def save
    item = Item.create(message: message)
    tag = Tag.where(name: name).first_or_initialize
    tag.save

    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end

end
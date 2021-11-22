Models

Dog (restaurant)
belongs_to :breeds (cuisine)
has_many :users, through :updates (reviews)
t.string "dog_name", t.string "mood", t.integer "weight"

User (user)
has_many :updates (reviews)
has_many :dogs (restaurants) through :updates (reviews)
name, email, password_digest (all strings)

Update (Review)
belongs_to :user
belongs_to :dog (restaurant)
(join table: 2 belongs_to)
content (string), training_score (integer), foreign keys user_id and dog_id t.timestamps

Breed (Cuisine)
has_many :dogs (restaurants)
t.string :"breed_name"


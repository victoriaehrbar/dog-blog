Models

Dog (restaurant)
belongs_to :breeds (cuisine)
has_many :users, through :updates (reviews)
t.string "dog_name", t.string "mood", t.integer "weight"

rails g resource Dog dog_name:string mood:string weight:integer breed:belongs_to --no-test-framework

User (user)
has_many :updates (reviews)
has_many :dogs (restaurants) through :updates (reviews)
name, email, password_digest (all strings)

rails g resource User name:string email:string password_digest:string

Update (Review)
belongs_to :user
belongs_to :dog (restaurant)
(join table: 2 belongs_to)
content (string), training_score (integer), foreign keys user_id and dog_id t.timestamps

rails g resource Update title:string content:text training_score:integer user:belongs_to dog:belongs_to

Breed (Cuisine)
has_many :dogs (restaurants)
t.string :"breed_name"

rails g resource Breed breed_name:string --no-test-framework


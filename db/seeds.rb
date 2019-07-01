user = User.create!(username: 'Zackbert',
                    email: 'zberto@gmail.com',
                    password: 'password',
                    password_confirmation: 'password')
user2 = User.create!(username: 'Gregbert',
                     email: 'gberto@gmail.com',
                     password: 'password',
                     password_confirmation: 'password')
user3 = User.create!(username: 'Bobo',
                     email: 'bobo@gmail.com',
                     password: 'password',
                     password_confirmation: 'password')
user4 = User.create!(username: 'Grablo',
                     email: 'gurp@gmail.com',
                     password: 'password',
                     password_confirmation: 'password')

campaign = Campaign.create!(user: user,
                            title: 'Wheel of Time',
                            description: 'It begins.')

Chapter.create!(campaign: campaign,
                title: 'The Eye of The World',
                description: 'The adventure begins')
Chapter.create!(campaign: campaign,
                title: 'The Great Hunt',
                description: 'The adventure continues!')

# GM Characters
Character.create!(user: user,
                  campaign: campaign,
                  name: 'Thomdril Merrilin',
                  description: 'A wandering bard',
                  pc_class: 'Bard',
                  level: 6)

# PC Characters
Character.create!(user: user2,
                  campaign: campaign,
                  name: 'Rand',
                  description: 'A regular boy in the village',
                  pc_class: 'Farmer',
                  level: 1)
Character.create!(user: user3,
                  campaign: campaign,
                  name: 'Mat',
                  description: 'A pain in the butt',
                  pc_class: 'Farmer',
                  level: 1)
Character.create!(user: user4,
                  campaign: campaign,
                  name: 'Perrin',
                  description: 'Slow to action, but thoughtful',
                  pc_class: 'Farmer',
                  level: 1)

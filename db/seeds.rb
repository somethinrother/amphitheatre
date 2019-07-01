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

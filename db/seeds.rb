#Seed file is used for testing my actual objects on the application.

User.destroy_all
Show.destroy_all



kenny = User.create(username: 'KennyP', email: "kenny@gmail.com", password_digest: 12345678)
erica = User.create(username: 'Ericawhite', email: "erica@gmail.com", password_digest: 12345678)
kayla = User.create(username: 'Kaylasmiley', email: "kayla@gmail.com", password_digest: 12345678)
jared = User.create(username: 'Jared.davis', email: "jared@gmail.com", password_digest: 12345678)
nia = User.create(username: 'Ania.lenee', email: "nia@gmail.com", password_digest: 12345678)


show =Show.create(name: "Ozark", category: "Suspense", seasons: "8", description: "just another show", rating: 5)
new_show2 =Show.create(name: "Fresh Prince", category: "Comedy", seasons: "8", description: "just another show", rating: 5)
new_show3 =Show.create(name: "The Flash", category: "Action", seasons: "8", description: "just another show", rating: 5)
new_show4 =Show.create(name: "Family Guy", category: "Comedy", seasons: "8", description: "just another show", rating: 5)
new_show5 =Show.create(name: "Dirty Money", category: "Docu-Series", seasons: "8", description: "just another show", rating: 5)
new_show6 =Show.create(name: "Love is Blind", category: "Drama", seasons: "8", description: "just another show", rating: 5)

#Seed file is used for testing my actual objects on the application.

User.destroy_all
Show.destroy_all



kenny = User.create(username: 'KennyP', email: "kenny@gmail.com", password_digest: 12345)
erica = User.create(username: 'Ericawhite', email: "erica@gmail.com", password_digest: 12345)
kayla = User.create(username: 'Kaylasmiley', email: "kayla@gmail.com", password_digest: 12345)
jared = User.create(username: 'Jared.davis', email: "jared@gmail.com", password_digest: 12345)
nia = User.create(username: 'Ania.lenee', email: "nia@gmail.com", password_digest: 12345)


new_show1 =Show.create(name: "Ozark", category: "Suspense", seasons: "3", description: "A dark show, worth watching", rating: 3, user_id: kenny.id)
new_show2 =Show.create(name: "Fresh Prince", category: "Comedy", seasons: "8", description: "A funny classic show", rating: 5, user_id: erica.id)
new_show3 =Show.create(name: "The Flash", category: "Action", seasons: "7", description: "Action filled barry allen", rating: 4, user_id: kayla.id)
new_show4 =Show.create(name: "Family Guy", category: "Comedy", seasons: "16", description: "LOVE IT", rating: 5, user_id: jared.id)
new_show5 =Show.create(name: "Dirty Money", category: "Docu-Series", seasons: "2", description: "just another show", rating: 3, user_id: nia.id)
new_show6 =Show.create(name: "Love is Blind", category: "Drama", seasons: "1", description: "A fake love show", rating: 3, user_id: kenny.id)

package top.maary.basketmanager.re.domain.engine

import kotlin.random.Random

object ProceduralNames {
    private val firstNames = listOf(
        "James", "John", "Robert", "Michael", "William", "David", "Richard", "Joseph", "Thomas", "Charles",
        "Christopher", "Daniel", "Matthew", "Anthony", "Donald", "Mark", "Paul", "Steven", "Andrew", "Kenneth",
        "Joshua", "Kevin", "Brian", "George", "Edward", "Ronald", "Timothy", "Jason", "Jeffrey", "Ryan",
        "Jacob", "Gary", "Nicholas", "Eric", "Jonathan", "Stephen", "Larry", "Justin", "Scott", "Brandon",
        "Benjamin", "Samuel", "Gregory", "Frank", "Alexander", "Raymond", "Patrick", "Jack", "Dennis", "Jerry",
        "Tyler", "Aaron", "Jose", "Adam", "Nathan", "Henry", "Douglas", "Zachary", "Peter", "Kyle",
        "Walter", "Ethan", "Jeremy", "Harold", "Keith", "Christian", "Roger", "Noah", "Gerald", "Carl",
        "Terry", "Sean", "Austin", "Arthur", "Lawrence", "Jesse", "Dylan", "Bryan", "Joe", "Jordan",
        "Billy", "Bruce", "Albert", "Willie", "Gabriel", "Logan", "Alan", "Juan", "Wayne", "Roy",
        "Ralph", "Randy", "Eugene", "Vincent", "Russell", "Louis", "Philip", "Bobby", "Johnny", "Bradley",
        "Luka", "Nikola", "Giannis", "Dirk", "Pau", "Marc", "Manu", "Tony", "Rudy", "Bogdan",
        "Bojan", "Goran", "Jonas", "Kristaps", "Danilo", "Ricky", "Dennis", "Clint", "Serge", "Steven"
    )

    private val lastNames = listOf(
        "Smith", "Johnson", "Williams", "Brown", "Jones", "Miller", "Davis", "Garcia", "Rodriguez", "Wilson",
        "Martinez", "Anderson", "Taylor", "Thomas", "Hernandez", "Moore", "Martin", "Jackson", "Thompson", "White",
        "Lopez", "Lee", "Gonzalez", "Harris", "Clark", "Lewis", "Robinson", "Walker", "Perez", "Hall",
        "Young", "Allen", "Sanchez", "Wright", "King", "Scott", "Green", "Baker", "Adams", "Nelson",
        "Hill", "Ramirez", "Campbell", "Mitchell", "Roberts", "Carter", "Phillips", "Evans", "Turner", "Torres",
        "Parker", "Collins", "Edwards", "Stewart", "Flores", "Morris", "Nguyen", "Murphy", "Rivera", "Cook",
        "Rogers", "Morgan", "Peterson", "Cooper", "Reed", "Bailey", "Bell", "Gomez", "Kelly", "Howard",
        "Ward", "Cox", "Diaz", "Richardson", "Wood", "Watson", "Brooks", "Bennett", "Gray", "James",
        "Reyes", "Cruz", "Hughes", "Price", "Myers", "Long", "Foster", "Sanders", "Ross", "Morales",
        "Powell", "Sullivan", "Russell", "Ortiz", "Jenkins", "Gutierrez", "Perry", "Butler", "Barnes", "Fisher",
        "Doncic", "Jokic", "Antetokounmpo", "Nowitzki", "Gasol", "Ginobili", "Parker", "Gobert", "Bogdanovic", "Dragic",
        "Valanciunas", "Porzingis", "Gallinari", "Rubio", "Schroder", "Capela", "Ibaka", "Adams", "Vucevic", "Simmons"
    )

    fun getRandomFullName(): String {
        val first = firstNames[Random.nextInt(firstNames.size)]
        val last = lastNames[Random.nextInt(lastNames.size)]
        return "$first $last"
    }
}

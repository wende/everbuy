APP_NAME = "Everbuy"

i18n.setDefaultLanguage "pl"
Meteor.startup ->
  if not i18n.getLanguage() then i18n.setLanguage("pl")

i18n.map "en",
  about :
    description: "Everbuy in an application which allows You to repeatedly look for items You like on online vendors"
    learn_more: "Learn more"
    link: "#"
  add: "Add"
  add_new_query : "Add new query",
  app_name: APP_NAME
  coming_soon: 'Coming soon!'
  coming_soon_plans: 'Premium plans are soon to be released. Keep patience'
  login: "Sign in"
  login_for: "To add Your own queries"
  menu:
    about: "About"
    home: "Home"
    observed: "Observed"
    plans: "Plans"
    powered: "Powered by Modulistics 0.1.1©",
  motto: "Track down the products You like!"
  is: "is"
  query:
    insert: "Insert"
    title: "title"
    price_bottom: "Price higher than"
    price_top: "Price lower than"
    sending: "Sending"
    optional :"Optional"
    too_many : "More then {$1} items found (5 Max). Be more specific"
  reconnecting: "Trying to connect"
  results:
    too_much: "The amount of items found for query <a>{$1}</a> is a little bit high. Consider being more specific"
    too_much_title: "Too many items!"
    found: "Match found for: {$1}!"
    item_found: "Item found!"
    started_looking: "Looking"
  welcome:
    activity: "Saying hello"
    text: "Welcome to #{APP_NAME}!  "
    place: "London, United Kingdom"

i18n.map "pl",
  about :
    description: "Everbuy to aplikacja, dzięki której znajdziesz przedmioty na platformach transakcyjnych"
    learn_more: "Dowiedz się więcej"
    link: "#"
  add: "Dodaj"
  add_new_query : "Dodaj nowe wyszukiwanie",
  app_name: APP_NAME
  coming_soon: 'Już wkrótce!'
  coming_soon_plans: 'Plany premium już wkrótce'
  login: "Zaloguj się"
  login_for: "Aby dodawać własne wyszukiwania"
  menu:
    about: "Informacje"
    home: "Strona Główna"
    observed: "Obserwowane"
    plans: "Premium"
    powered: "Powered by Modulistics 0.1.1©"
  motto: "Bądź na bieżąco z ulubionymi przedmiotami"
  is : ":"
  query:
    insert:  "Dodaj"
    title: "Nazwa"
    price_bottom: "Cena wyższa niż"
    price_top: "Cena niższa niż"
    sending: "Wysyłanie"
    optional: "Opcjonalnie"
    too_many : "Znaleziono wiecej niż {$1} przedmiotów (Max 5). Wpisz bardziej szczegółowe dane"
  reconnecting: "Łączę z serwerem"
  results:
    too_much: "Ilość przedmiotów dla wyszukiwania <a>'{$1}'</a> jest wyjątkowo duża. Spróbuj doprecyzować opis. Wyłączyliśmy wyszukiwanie tego przedmiotu"
    too_much_title: "Za dużo przedmiotów"
    found: "Znaleziono przedmiot <a>{$1}</a>"
    item_found: "Znaleziono przedmiot!"
    started_looking: "Rozpoczęto wyszukiwanie przedmiotu: <a>{$1}</a>"
  welcome:
    activity: "Witaj!"
    text: "Witamy w #{APP_NAME}! <br> Tutaj będą się pojawiały Twoje informacje o obserwowanych przedmiotach.
            Aby dodać nowe wyszukiwanie przejdź do <a href='messages'> zakładki Obserwowane </a>"
    place: "Londyn, U.K"

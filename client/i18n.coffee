APP_NAME = "Everbuy"

i18n.setDefaultLanguage "pl"
Meteor.startup ->
  if not i18n.getLanguage() then i18n.setLanguage("pl")

i18n.map "en",
  about :
    description: "Desc"
    learn_more: "Learn more"
    link: "#"
  add: "Add"
  add_new_query : "Add new query",
  app_name: APP_NAME
  coming_soon: 'Coming soon!'
  coming_soon_plans: 'Premium plans are soon to be released. Keep patience'
  menu:
    about: "About"
    home: "Home"
    observed: "Observed"
    plans: "Plans"
  motto: "Track down the products You like!"
  is: "is"
  query:
    title: "title"
    price_bottom: "Price higher than"
    price_top: "Price lower than"
  reconnecting: "Trying to connect"
  results:
    too_much: "The amount of items found for query '{$1}' is a little bit high. Consider being more specific"
    too_much_title: "Too many items!"
    found: "Match found for: {$1}!"
    item_found: "Item found!"
  welcome:
    activity: "Saying hello"
    text: "Welcome to #{APP_NAME}!  "
    place: "London, United Kingdom"

i18n.map "pl",
  about :
    description: "Deść"
    learn_more: "Dowiedz się więcej"
    link: "#"
  add: "Dodaj"
  add_new_query : "Dodaj nowe wyszukiwanie",
  app_name: APP_NAME
  coming_soon: 'Już wkrótce!'
  coming_soon_plans: 'Plany premium już wkrótce'
  menu:
    about: "Informacje"
    home: "Strona Główna"
    observed: "Obserwowane"
    plans: "Premium"
  motto: "Bądź na bieżąco z ulubionymi przedmiotami"
  is : ":"
  query:
    title: "Nazwa"
    price_bottom: "Cena wyższa niż"
    price_top: "Cena niższa niż"
  reconnecting: "Łączę z serwerem"
  results:
    too_much: "Ilość przedmiotów dla wyszukiwania <a>'{$1}'</a> jest wyjątkowo duża. Spróbuj doprecyzować opis. Wyłączyliśmy wyszukiwanie tego przedmiotu"
    too_much_title: "Za dużo przedmiotów"
    found: "Znaleziono przedmiot z Twojego wyszukiwania: <a>{$1}</a>. Kliknij mnie aby przejść do aukcji!"
    item_found: "Znaleziono przedmiot!"
  welcome:
    activity: "Witaj!"
    text: "Witamy w #{APP_NAME}! <br> Tutaj będą się pojawiały Twoje informacje o obserwowanych przedmiotach.
            Aby dodać nowe wyszukiwanie przejdź do <a href='messages'> zakładki Obserwowane </a>"
    place: "Londyn, U.K"
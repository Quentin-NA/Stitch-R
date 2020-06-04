SupplierSearchesUser.destroy_all
SupplierSearch.destroy_all
# Get image urls from GooglePlay store, open image in new window

puts 'SupplierSearch Creation'
a = SupplierSearch.create(
  name: "Uber",
  from: "uber.france@uber.com",
  contains: "'votre course'",
  not_contains: "Jump",
  image: "logo/uber.png"
  )

b = SupplierSearch.create(
  name: "Oui-SNCF",
  image: "https://lh3.googleusercontent.com/1SOSCf--cpvBQPBx3hlfMdWXpQfvlWwHoxg6F5aTI8WVTzRudsA7YeohiDkH7WsyRw=s360-rw",
  from: "noreply@oui.sncf",
  attachment: true
  )

c = SupplierSearch.create(
  name: "Trainline",
  image: "https://lh3.googleusercontent.com/01DZthgdocCF5tYXt3MxpV_zTxXV1CST6U9Fbsr9SXygqw7dD42YjlZMAxUO6N4-VZI=s360-rw",
  from: "guichet@trainline.fr",
  attachment: true
  )

d = SupplierSearch.create(
  name: "Free Mobile",
  image: "https://lh3.googleusercontent.com/h3CRflIF-NE--cL35GXcNCJzk2PYV4_NO1XxRFifnKUKfnGuMwAtcY8Vs6YQE4yhY5I=s360-rw",
  from: "freemobile@free-mobile.fr",
  attachment: true
  )
e = SupplierSearch.create(
  name: "Bouygues Telecom",
  image: "https://lh3.googleusercontent.com/FbOR4JspRzJa3XbJCh_kj4sTZZz61s2PDj4RFv0EZ2ROY3HGG6YkSITEUwrbljsg6A=s360-rw",
  from: "facture@bouygues-telecom.fr",
  )

f = SupplierSearch.create(
  name: "Airbnb",
  image: "https://lh3.googleusercontent.com/BQnvuZR500pg2ulvv3FBmRI93ODz3AjNfbz92hCieuJLvmbGY36AKhETMTTfTDgpPQI=s360-rw",
  from: "express@airbnb.com",
  contains: "reçu"
  )

g = SupplierSearch.create(
  name: "Booking",
  image: "logo/booking.png",
  from: "customer.service@booking.com",
  contains: "confirmée"
  )

h = SupplierSearch.create(
  name: "Easyjet",
  image: "logo/easyjet.png",
  from: "confirmation@easyjet.com"
  )

i = SupplierSearch.create(
  name: "Uber Eats",
  image: "logo/uber_eats.png",
  from: "uber.france@uber.com",
  subject: "eats",
  not_contains: "pourboire",
  )

j = SupplierSearch.create(
  name: "Uber Jump",
  image: "logo/jump.png",
  from: "uber.france@uber.com",
  subject: "Jump"
  )

k = SupplierSearch.create(
  name: "Lime",
  image: "logo/lime.png",
  from: "no-reply@limebike.com",
  subject: "reçu"
  )

puts 'SupplierSearch Created'


# SupplierSearchesUser.create(supplier_search: a, user: User.first)
# SupplierSearchesUser.create(supplier_search: b, user: User.first)
# SupplierSearchesUser.create(supplier_search: c, user: User.first)
# SupplierSearchesUser.create(supplier_search: d, user: user.first)
# SupplierSearchesUser.create(supplier_search: e, user: "1")
# SupplierSearchesUser.create(supplier_search: f, user: "1")
# SupplierSearchesUser.create(supplier_search: g, user: "1")

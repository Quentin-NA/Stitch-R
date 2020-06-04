SupplierSearchesUser.destroy_all
SupplierSearch.destroy_all
# image urls coming from Android store (/!\ ip gets blocked when pinging too often)

puts 'SupplierSearch Creation'
a = SupplierSearch.create(
  name: "Uber",
  from: "uber.france@uber.com",
  contains: "'votre course'",
  not_contains: "Jump",
  image: "logo/uber.png"
  start_date: "01/01/2018"
  )
# => https://lh3.googleusercontent.com/qy_wZ92sFQccojEtscg52vtdAQmCIeQ4jsybMPmuML9Or7_SEOyrt0Jn0wyG-l2Fyw=s360-rw

b = SupplierSearch.create(
  name: "Oui-SNCF",
  image: "https://lh3.googleusercontent.com/1SOSCf--cpvBQPBx3hlfMdWXpQfvlWwHoxg6F5aTI8WVTzRudsA7YeohiDkH7WsyRw=s360-rw",
  from: "noreply@oui.sncf",
  attachment: true
  start_date: "01/01/2019"
  )

c = SupplierSearch.create(
  name: "Trainline",
  image: "https://lh3.googleusercontent.com/01DZthgdocCF5tYXt3MxpV_zTxXV1CST6U9Fbsr9SXygqw7dD42YjlZMAxUO6N4-VZI=s360-rw",
  from: "guichet@trainline.fr",
  attachment: true
  start_date: "01/01/2019"
  )
# => https://lh3.googleusercontent.com/01DZthgdocCF5tYXt3MxpV_zTxXV1CST6U9Fbsr9SXygqw7dD42YjlZMAxUO6N4-VZI=s360-rw

d = SupplierSearch.create(
  name: "Free Mobile",
  image: "https://lh3.googleusercontent.com/h3CRflIF-NE--cL35GXcNCJzk2PYV4_NO1XxRFifnKUKfnGuMwAtcY8Vs6YQE4yhY5I=s360-rw",
  from: "freemobile@free-mobile.fr",
  attachment: true
  start_date: "01/01/2019"
  )

e = SupplierSearch.create(
  name: "Bouygues Telecom",
  image: "https://lh3.googleusercontent.com/FbOR4JspRzJa3XbJCh_kj4sTZZz61s2PDj4RFv0EZ2ROY3HGG6YkSITEUwrbljsg6A=s360-rw",
  from: "facture@bouygues-telecom.fr",
  start_date: "01/01/2018"
  )

# => https://lh3.googleusercontent.com/FbOR4JspRzJa3XbJCh_kj4sTZZz61s2PDj4RFv0EZ2ROY3HGG6YkSITEUwrbljsg6A=s360-rw

f = SupplierSearch.create(
  name: "Airbnb",
  image: "https://lh3.googleusercontent.com/BQnvuZR500pg2ulvv3FBmRI93ODz3AjNfbz92hCieuJLvmbGY36AKhETMTTfTDgpPQI=s360-rw",
  from: "express@airbnb.com",
  contains: "reçu"
  start_date: "01/01/2019"
  )

g = SupplierSearch.create(
  name: "Booking",
  image: "logo/booking.png",
  from: "customer.service@booking.com",
  contains: "confirmée"
  start_date: "01/01/2019"
  )
# => https://lh3.googleusercontent.com/A0QsKezU_em5H1IiwKUUluEDOK7VuGVNLii3FVL89NDVKVvRsOSHjS5AeLAUywYhArE3=s360-rw

h = SupplierSearch.create(
  name: "Easyjet",
  image: "logo/easyjet.png",
  from: "confirmation@easyjet.com"
  start_date: "01/01/2019"
  )

i = SupplierSearch.create(
  name: "Uber Eats",
  image: "logo/uber_eats.png",
  from: "uber.france@uber.com",
  subject: "eats",
  not_contains: "pourboire",
  start_date: "01/01/2019"
  )
# => https://lh3.googleusercontent.com/54ePLhFbvTmzRyk2AnX3cu3mOEYwcAUU7cBT6GtKrsJT8dbVj-N66JpTNF80C6bRiNzo=s360-rw

j = SupplierSearch.create(
  name: "Uber Jump",
  image: "logo/jump.png",
  from: "uber.france@uber.com",
  subject: "Jump"
  start_date: "01/01/2019"
  )

k = SupplierSearch.create(
  name: "Lime",
  image: "logo/lime.png",
  from: "no-reply@limebike.com",
  subject: "reçu"
  start_date: "01/01/2019"
  )

l = SupplierSearch.create(
  name: "Oui-go",
  image: "https://lh3.googleusercontent.com/01DZthgdocCF5tYXt3MxpV_zTxXV1CST6U9Fbsr9SXygqw7dD42YjlZMAxUO6N4-VZI=s360-rw",
  from: "ne-pas-repondre@pasngr.ouigo.com",
  attachment: true
  start_date: "01/01/2019"
  )

m = SupplierSearch.create(
  name: "Taxi G7",
  image: "no-reply@g7.fr",
  subject: "votre course",
  start_date: "01/01/2019"
  )
# => https://lh3.googleusercontent.com/7_oQX4naDvPEgU61ktMMJV3pX2v9qMH7oG9UeqqiKO37Tep0VGCqH7BKOASN2ra_DTY=s360-rw


puts 'SupplierSearch Created'



# SupplierSearchesUser.create(supplier_search: a, user: User.first)
# SupplierSearchesUser.create(supplier_search: b, user: User.first)
# SupplierSearchesUser.create(supplier_search: c, user: User.first)
# SupplierSearchesUser.create(supplier_search: d, user: user.first)
# SupplierSearchesUser.create(supplier_search: e, user: "1")
# SupplierSearchesUser.create(supplier_search: f, user: "1")
# SupplierSearchesUser.create(supplier_search: g, user: "1")

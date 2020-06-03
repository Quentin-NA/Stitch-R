# SupplierSearchesUser.destroy_all
# SupplierSearch.destroy_all

puts 'SupplierSearch Creation'
a = SupplierSearch.create(from: "uber.france@uber.com")
b = SupplierSearch.create(from: "noreply@oui.sncf")
c = SupplierSearch.create(from: "noreply@heroku.com")
d = SupplierSearch.create(from: "freemobile@free-mobile.fr")
e = SupplierSearch.create(from: "ne_pas_repondre@sfr.fr")
f = SupplierSearch.create(from: "express@airbnb.com")
g = SupplierSearch.create(from: "noreply.mobile@orange.com")
puts 'SupplierSearch Created'


# SupplierSearchesUser.create(supplier_search: a, user: User.first)
# SupplierSearchesUser.create(supplier_search: b, user: User.first)
# SupplierSearchesUser.create(supplier_search: c, user: User.first)
# SupplierSearchesUser.create(supplier_search: d, user: user.first)
# SupplierSearchesUser.create(supplier_search: e, user: "1")
# SupplierSearchesUser.create(supplier_search: f, user: "1")
# SupplierSearchesUser.create(supplier_search: g, user: "1")

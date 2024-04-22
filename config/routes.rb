Rails.application.routes.draw do
  get("/", { :controller => "zebra", :action => "squareform" })

  get("/square/new", { :controller => "zebra", :action => "squareform" })
  get("/square/results", { :controller => "zebra", :action => "calsquareresult" })

  get("/square_root/new", { :controller => "zebra", :action => "squarerootform" })
  get("/square_root/results", { :controller => "zebra", :action => "calsquarerootresult" })

  get("/random/new", { :controller => "zebra", :action => "randomform" })
  get("/random/results", { :controller => "zebra", :action => "calrandomresult" })

  get("/payment/new", { :controller => "zebra", :action => "paymentform" })
  get("/payment/results", { :controller => "zebra", :action => "calpaymentresult" })

end

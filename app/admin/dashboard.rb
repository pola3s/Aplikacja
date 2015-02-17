ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
    #  span class: "blank_slate" do
    #    span I18n.t("active_admin.dashboard_welcome.welcome")
    #    small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #  end
    end




     columns do

       column do
        panel "Ostatnie zamówienia" do
          table_for Cart.last(5).map do |cart|
            column("Zamówienie"){|cart| link_to(cart.id, admin_cart_path(cart.id)) }
            column("Data"){|cart| cart.created_at }
            column("Status") {|cart| status_tag(cart.state) }
            column("Suma") {|cart| number_to_currency cart.total_price }
          end
         end
       end


       #column do
       #  panel "Najnowsi klienci" do
       #    table_for User.last(5).map do |user|
       #      column("Użytkownik") {|user| link_to(user.name+" "+user.surname, admin_customer_path(user.id)) }
       #      column("Email"){|user| user.email }
       #      column("Telefon"){|user| user.phone }
       #    end
       #  end
       #end

     end


  end
end

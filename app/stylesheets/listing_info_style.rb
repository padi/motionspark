# implement :sizeToFit value in Teacup Stylesheets
Teacup.handler UILabel, :sizeToFit { |label, apply|
  label.sizeToFit if apply
}

Teacup::Stylesheet.new :listing_info do
  style :root,
    landscape: true,
    backgroundColor: UIColor.blackColor

  style UILabel,
    sizeToFit: true,
    textColor: UIColor.whiteColor,
    backgroundColor: UIColor.blackColor

  style :listing_id,
    left: 10,
    top: 10,
    text: 'Listing ID:',
    landscape: {
      width: 360
    }

  style :public_remarks, extends: :listing_id,
    top: 30,
    text: 'Public Remarks:'

  style :list_agent_first_name, extends: :listing_id,
    top: 50,
    text: 'List Agent First Name:'

  style :list_agent_last_name, extends: :listing_id,
    top: 70,
    text: 'List Agent Last Name:'

  style :list_price, extends: :listing_id,
    top: 90,
    text: 'List Price:'

  style :list_agent_email, extends: :listing_id,
    top: 110,
    text: 'List Agent Email:'

  style :city, extends: :listing_id,
    top: 130,
    text: 'City:'
end
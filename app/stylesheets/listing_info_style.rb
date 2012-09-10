# implement :sizeToFit value in Teacup Stylesheets
Teacup.handler UILabel, :sizeToFit { |label, apply|
  label.sizeToFit if apply
}

Teacup::Stylesheet.new :listing_info do
  style :root,
    landscape: true

  style :listing_id,
    left: 10,
    top: 10,
    text: 'Listing ID:',
    sizeToFit: true,
    textColor: UIColor.whiteColor,
    backgroundColor: UIColor.redColor,
    landscape: {
      width: 360
    }

  style :public_remarks, extends: :listing_id,
    top: 30,
    text: 'Public Remarks:'


  style :agent_name, extends: :listing_id,
    top: 50,
    text: 'Agent Name:'
end
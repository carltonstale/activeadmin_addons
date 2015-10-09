ActiveAdmin.register Invoice do
  permit_params :legal_date, :number, :paid, :state, :attachment, :photo

  index do
    selectable_column
    id_column
    tag_column :state
    bool_column :paid
    image_column :photo, style: :thumb
    attachment_column :attachment
    column :legal_date
    number_column :number, as: :currency, unit: "$", separator: ","
    actions
  end

  show do
    attributes_table do
      row :id
      tag_row :state
      bool_row :paid
      image_row("Mi foto", :photo, style: :big, &:photo)
      attachment_row("Mi documento", :attachment, truncate: false, &:attachment)
      row :legal_date
      number_row("Número", :number, as: :human, &:number)
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :state
      f.input :paid
      f.input :number, as: :tags
      f.input :attachment
      f.input :photo
    end
    f.actions
  end
end

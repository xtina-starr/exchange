def gravity_v1_artwork(options: {})
  {
    'id' => 'cat',
    'title' => 'Cat',
    'default_image_id' => 'image',
    'images' => [{
      'id' => 'image',
      'image_urls' => { 'cats' => '/path/to/cats.jpg' }
    }],
    'confidential_notes' => 'sssh'
  }.merge(options).with_indifferent_access
end

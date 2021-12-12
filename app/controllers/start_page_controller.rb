class StartPageController < ApplicationController
  def index
    @variable = { text: 'Lists(testing)', link: '/test_page' }
    @name = ['Grindan',
    'Jabarkas',
    'Nimbus',
    'Dace',
    'Orrin',
    'Kyrre',
    'Lacus',
    'Adela',
    'Cuthbert',
    'Thunar']
    @text = ['Reiciendis ducimus alias molestias ut eum deserunt doloremque ea at.',
    'Nostrum optio qui perspiciatis animi numquam ipsa quis quis tempore.',
    'Maxime dolor optio corporis vel enim saepe ut omnis explicabo.',
    'Dicta quia sit aut ut est itaque ratione officiis omnis.',
    'Eaque iste cumque deleniti beatae asperiores odit ullam qui doloribus.',
    'Tenetur ad vero exercitationem itaque et quasi adipisci porro quo.',
    'Dolorem soluta sed dolore exercitationem ea repudiandae at voluptate in.',
    'Soluta sit et minima necessitatibus doloribus facilis voluptatem culpa omnis.',
    'Totam est architecto tempore aut ratione et nisi ut consequuntur.',
    'Dolor inventore esse voluptatem asperiores vel ut doloribus necessitatibus temporibus.']
    @picture = []
  end
end

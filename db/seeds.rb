# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
products = [
  # Kits
  { name: 'Kit Básico de Teclado', category: 'Kits', price: 499.99, description: 'Um kit básico para iniciantes em teclado.', image_url: 'https://i.imgur.com/jYo7Uxm.png' },
  { name: 'Kit de Violão Completo', category: 'Kits', price: 599.99, description: 'Inclui violão, capa, palhetas e mais.', image_url: 'https://i.imgur.com/WtoVPkf.png' },
  { name: 'Kit de Estúdio Iniciante', category: 'Kits', price: 799.99, description: 'Tudo que você precisa para começar a gravar.', image_url: 'https://i.imgur.com/ZFBmoDo.png' },

  # Cordas
  { name: 'Guitarra Elétrica Ibanez', category: 'Cordas', price: 699.99, description: 'Guitarra elétrica de alta qualidade.', image_url: 'https://i.imgur.com/hNusojU.png' },
  { name: 'Violão Acústico Yamaha', category: 'Cordas', price: 299.99, description: 'Perfeito para iniciantes e profissionais.', image_url: 'https://i.imgur.com/m6CKarZ.png' },
  { name: 'Baixo Fender Jazz', category: 'Cordas', price: 899.99, description: 'Baixo elétrico com excelente sonoridade.', image_url: 'https://i.imgur.com/OMlZcDH.png' },

  # Teclas
  { name: 'Teclado Yamaha PSR-E363', category: 'Teclas', price: 399.99, description: 'Teclado versátil para iniciantes.', image_url: 'https://i.imgur.com/p8pdgZN.png' },
  { name: 'Piano Digital Roland FP-30', category: 'Teclas', price: 999.99, description: 'Piano digital com som autêntico e teclas ponderadas.', image_url: 'https://i.imgur.com/luCsLH1.png' },
  { name: 'Sintetizador Korg Minilogue', category: 'Teclas', price: 499.99, description: 'Sintetizador polifônico analógico.', image_url: 'https://i.imgur.com/D5XIG6u.png' },

  # Áudio
  { name: 'Microfone Yamaha HighDef', category: 'Áudio', price: 349.99, description: 'Microfone versátil para iniciantes que estão começando a cantar.', image_url: 'https://i.imgur.com/ahumyDl.png' },
  { name: 'Kit PodCast e Estudio', category: 'Áudio', price: 789.99, description: 'Kit para quem deseja começar um podcast ou montar um estudio e cantar com os amigos.', image_url: 'https://i.imgur.com/CTD05fE.png' },
  { name: 'Microfone TopNight', category: 'Áudio', price: 499.99, description: 'Melhor microfone para quem deseja cantar aquele Jazz suave.', image_url: 'https://i.imgur.com/dhaM99g.png' },

  # Bateria
  { name: 'Bateria Eletrônica Seven Sd-700', category: 'Bateria', price: 1929.99, description: 'Bateria versátil para iniciantes que estão começando a tocar.', image_url: 'https://i.imgur.com/GGFqm6T.png' },
  { name: 'Bateria Premium Dx722', category: 'Bateria', price: 2389.99, description: 'Bateria construída com 6 folhas em Poplar, com canoas em Alumínio e ferragens pretas. Com um visual sofisticado e sonoridade agradável.', image_url: 'https://i.imgur.com/dTZvkzI.png' },
  { name: 'Bateria Infantil Rock Baby AM2', category: 'Bateria', price: 1479.99, description: 'Bateria não é classificada como brinquedo, é um instrumento musical, profissional para criança', image_url: 'https://i.imgur.com/SlXmYXW.png' },

  # Sopro
  { name: 'Amw Custom Trompete Laqueado Sib Si Bemol', category: 'Sopro', price: 1129.99, description: 'Este trompete é feito com um acabamento laqueado, proporcionando um visual elegante e sofisticado, além de uma durabilidade excepcional.', image_url: 'https://i.imgur.com/RJy4dTm.png' },
  { name: 'Henniu AS200 Eb Saxofone Alto Latão Laqueado', category: 'Sopro', price: 2479.99, description: 'O saxofone alto Eb com tom preciso, timbre suave e aparência delicada é competente tanto no exercício diário quanto no show de show.', image_url: 'https://i.imgur.com/CbKFXXp.png' },
  { name: 'Sax Soprano Eagle Sp502ln', category: 'Sopro', price: 4579.99, description: 'O Sax Soprano Eagle SP502LN é uma expressão da arte musical, combinando uma sonoridade profunda e vibrante com um design meticulosamente elaborado, tornando-se uma escolha ideal para músicos que buscam qualidade e estética em um único instrumento.', image_url: 'https://i.imgur.com/ZNLSxyD.png' },

]

# Criando os produtos no banco de dados
products.each do |product|
  Product.create(product)
end

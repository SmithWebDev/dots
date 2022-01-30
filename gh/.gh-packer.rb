extensions = ['dlvhdr/gh-prs', 'yusukebe/gh-markdown-preview', 'gennaro-tedesco/gh-s', 'korosuke613/gh-user-stars',
              'samcoe/gh-repo-explore']

extensions.each do |extension|
  puts "Installing #{extension}"
  system("gh extension install #{extension}")
  system('sleep 3')
end

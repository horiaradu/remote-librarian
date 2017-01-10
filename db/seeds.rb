# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[
  { code: 'R0501', authors: 'Felix Buffiere', title: 'Miturile lui Homer si gandirea greaca', location: 'Raft 05',
    year: 1987, publisher: 'Univers' },
  { code: 'R1503', authors: 'Radu Paraschivescu', title: 'Racani, pifani si veterani', location: 'Raft 15',
    year: 2008, publisher: 'Humanitas' },
  { code: 'R0502', authors: 'Felix Buffiere', title: 'Miturile lui Homer si gandirea greaca', location: 'Raft 05',
    year: 1987, publisher: 'Univers' },
  { code: 'R1504', authors: 'Radu Paraschivescu', title: 'Racani, pifani si veterani', location: 'Raft 15',
    year: 2008, publisher: 'Humanitas' },
  { code: 'R0503', authors: 'Felix Buffiere', title: 'Miturile lui Homer si gandirea greaca', location: 'Raft 05',
    year: 1987, publisher: 'Univers' },
  { code: 'R1505', authors: 'Radu Paraschivescu', title: 'Racani, pifani si veterani', location: 'Raft 15',
    year: 2008, publisher: 'Humanitas' },
  { code: 'R0504', authors: 'Felix Buffiere', title: 'Miturile lui Homer si gandirea greaca', location: 'Raft 05',
    year: 1987, publisher: 'Univers' },
  { code: 'R1506', authors: 'Radu Paraschivescu', title: 'Racani, pifani si veterani', location: 'Raft 15',
    year: 2008, publisher: 'Humanitas' }
].each do |data|
  Book.create(data)
end
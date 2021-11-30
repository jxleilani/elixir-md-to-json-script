# elixir-md-to-json-script

Example of a script written in `elixir` that takes markdown files and creates a json structure like so:

````
  const tree = [
    {
      folder: ‘Getting Started’,
      sub: [{ name: ‘Getting Started’, content: ‘How to get started’ }]
    },
    {
      folder: ‘Groups’,
      sub: [
        { name: ‘Create a group’, content: ‘How to create a group’ },
        { name: ‘Edit a group’, content: ‘How to edit group’ }
      ]
    },
    {
      folder: ‘Dashboards’,
      sub: [
        { name: ‘Create a dashboard’, content: ‘How to create a dashboard’ },
        { name: ‘Edit a dashboard’, content: ‘How to edit dashboard’}
      ]
   }
 ]
 ````
 
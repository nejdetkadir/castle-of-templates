[![Codacy Badge](https://app.codacy.com/project/badge/Grade/0be4a25986244beba73355cf97850d5f)](https://www.codacy.com/gh/nejdetkadir/castle-of-templates/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=nejdetkadir/castle-of-templates&amp;utm_campaign=Badge_Grade)

# Castle of Templates
## Installation
- Install GEM dependencies:

  ```bash
  bundle install
  ```

- Install asset dependencies:

  ```bash
  yarn install
  ```

- Create database, migrate tables and run the seed data:

  ```bash
  rails db:create
  rails db:migrate
  rails db:seed
  ```

- If you are setting up again, when you already have previous databases:

  ```bash
  rails db:reset
  ```
- For dropping database
  ```bash
  rails db:drop
  ``` 

# LICENSE
```
GNU GENERAL PUBLIC LICENSE Version 3
```
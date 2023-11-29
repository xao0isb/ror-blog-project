![GitHub Actions](https://github.com/xao0isb/ror-blog-project/actions/workflows/main.yml/badge.svg)

# Блог
Ссылка на приложение: [https://xao0isb-ror-blog-project.up.railway.app/](https://xao0isb-ror-blog-project.up.railway.app/)

## Контрибьютинг
Установка:
```bash
make setup
```

Локальный запуск:
```bash
make start
```

Сидирование:
```bash
make seed
```

Тестирование:
```bash
make test
```

Линтинг:
```bash
make lint
```

Больше команд в [мейкфайле](https://github.com/xao0isb/ror-blog-project/tree/main/Makefile).

## Принцип работы:
Веб-приложение блога. Возможности:
- Регистрация, авторизация, выход из системы;
- Изменение, удаление аккаунта.
- Создание, изменение, удаление поста;
- Возможность поставить лайк посту;
- Возможность оставить комментарий посту;
- Возможность оставить комментарий к комментарию.

### [Контроллеры](https://github.com/xao0isb/ror-blog-project/tree/main/app/controllers):
- [HomeController *(index)*](https://github.com/xao0isb/ror-blog-project/tree/main/app/controllers/home_controller.rb)
- [ProfilesController *(show)*](https://github.com/xao0isb/ror-blog-project/tree/main/app/controllers/profiles_controller.rb)
- [PostsController *(show, new, create, edit, update, destroy)*](https://github.com/xao0isb/ror-blog-project/tree/main/app/controllers/posts_controller.rb):
    - [CommentsController *(create)*](https://github.com/xao0isb/ror-blog-project/tree/main/app/controllers/posts/comments_controller.rb)
    - [LikesController *(create, destroy)*](https://github.com/xao0isb/ror-blog-project/tree/main/app/controllers/posts/likes_controller.rb)
- [MyPostsController *(show)*](https://github.com/xao0isb/ror-blog-project/tree/main/app/controllers/my/posts_controller.rb)

### [Модели](https://github.com/xao0isb/ror-blog-project/tree/main/app/models):
- [User](https://github.com/xao0isb/ror-blog-project/tree/main/app/models/user.rb), связи:
    - has many *posts*, *likes*, *comments*
- [Post](https://github.com/xao0isb/ror-blog-project/tree/main/app/models/post.rb), связи:
    - belongs to *user (as creator)*, *category*
    - has many *likes*, *comments*
- [PostLike](https://github.com/xao0isb/ror-blog-project/tree/main/app/models/post_like.rb), связи:
    - belongs to *post*, *user*
- [PostComment](https://github.com/xao0isb/ror-blog-project/tree/main/app/models/post_comment.rb), связи:
    - belongs to *post*, *user*
- [Category](https://github.com/xao0isb/ror-blog-project/tree/main/app/models/category.rb), связи:
    - has many *posts*

### [Представления](https://github.com/xao0isb/ror-blog-project/tree/main/app/views):
- [home](https://github.com/xao0isb/ror-blog-project/tree/main/app/views/home)
- [profiles](https://github.com/xao0isb/ror-blog-project/tree/main/app/views/profiles)
- [posts](https://github.com/xao0isb/ror-blog-project/tree/main/app/views/posts):
    - [likes](https://github.com/xao0isb/ror-blog-project/tree/main/app/views/posts/likes)
    - [comments](https://github.com/xao0isb/ror-blog-project/tree/main/app/views/posts/comments)
- [my posts](https://github.com/xao0isb/ror-blog-project/tree/main/app/views/my/posts):
- [devise](https://github.com/xao0isb/ror-blog-project/tree/main/app/views/devise) (представления регистрации и авторизации)
- [layouts](https://github.com/xao0isb/ror-blog-project/tree/main/app/views/layouts) (общие части представлений)

### [Тесты](https://github.com/xao0isb/ror-blog-project/tree/main/test):
- [Контроллеры](https://github.com/xao0isb/ror-blog-project/tree/main/test/controllers):
    - [HomeControllerTest](https://github.com/xao0isb/ror-blog-project/tree/main/test/controllers/home_controller_test.rb)
    - [ProfilesControllerTest](https://github.com/xao0isb/ror-blog-project/tree/main/test/controllers/profiles_controller_test.rb)
    - [PostsControllerTest](https://github.com/xao0isb/ror-blog-project/tree/main/test/controllers/posts_controller_test.rb):
        - [LikesControllerTest](https://github.com/xao0isb/ror-blog-project/tree/main/test/controllers/posts/likes_controller_test.rb)
        - [CommentsControllerTest](https://github.com/xao0isb/ror-blog-project/tree/main/test/controllers/posts/comments_controller_test.rb)
    - [MyPostsControllerTest](https://github.com/xao0isb/ror-blog-project/tree/main/test/controllers/my/posts_controller_test.rb):
- [Фикстуры](https://github.com/xao0isb/ror-blog-project/tree/main/test/fixtures)

### [Сиды](https://github.com/xao0isb/ror-blog-project/tree/main/db/seeds/development):
- [Пользователи](https://github.com/xao0isb/ror-blog-project/tree/main/db/seeds/development/users.rb)
- [Посты](https://github.com/xao0isb/ror-blog-project/tree/main/db/seeds/development/posts.rb)
- [Категории](https://github.com/xao0isb/ror-blog-project/tree/main/db/seeds/development/categories.rb)
- [Комментарии](https://github.com/xao0isb/ror-blog-project/tree/main/db/seeds/development/post_comments.rb)

### [Локали](https://github.com/xao0isb/ror-blog-project/tree/main/config/locales)

При разработке использовались:
- Asdf - менеджер версий;
- Make;
- Slim + slim lint - шаблонизатор для упрощения процесса создания разметки;
- Bootstrap - быстрое создание интерфейса;
- Simple form - упрощенный процесс создания форм;
- Devise - функционал регистрации и авторизации;
- Ancestry - организация модели ActiveRecord в древовидную структуру (для создания функции ответа на комментарий);
- Faker - генерация ненастоящих данных - используется для тестирования;
- Minitest power assert - более удобное представлние метода assert при тестировании;
- Rubocop + rubocop rails + rubocop performance - лингтинг;
- Rails i18n - добавление интернационализации в приложение;
- Sentry - трекинг ошибок и производительности в продакшене.

## CI/CD
CI - используется GitHub Actions - [workflow](https://github.com/xao0isb/ror-blog-project/tree/main/.github/workflows/main.yml).

CD - используется railway.

## Sentry

Для трекинга оишбок и производительности в продакшене используется sentry.

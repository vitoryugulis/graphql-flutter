# graphql_app

Escolhi o padrão BLOC de gerenciamento de estado, sem nenhum pacote de terceiros (e.g. MobX, Cubit, etc). O teste é simples e não vi necessidade de aplicar uma solução mais robusta de gerenciamento de estado.
Segui fiel o máximo possível ao Design. 

### Rodando o app em modo debug
Crie o arquivo .env conforme exemplo (.env_example) e preencha com o endpoint da api e o secret.
Em seguida execute os comandos abaixo:
```
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter pub run
```
### Rodando em modo release

```
flutter run --release
```

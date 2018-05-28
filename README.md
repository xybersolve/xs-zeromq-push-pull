# zeromq-push-pull

> Push sends message on the network pull agent pick up message via round-robin

### NPM Script service starts
> Run each in separate shell session. One can run as many pull services as
optimal for your machine.

```sh
$ npm run push
$ npm run pull
$ npm run pull

```

### Run as Docker Compose
> The docker-compose file is currently scripted to start one push service and
two pull services.

```sh
$ make build
$ make run

```

##### Service Output
From Docker Compose method of running services. Note: they are not run as
daemon services, in order to watching the service feedback.

> Witness zeromq's orchestration of round-robin pull service competing consumption
of push requests. Sure, it is brain dead round-robin, but functional nonetheless.

```sh
zeromq-push   | push binding to: tcp://*:5688
zeromq-pull01 | pull connecting: tcp://push:5688
zeromq-pull02 | pull connecting: tcp://push:5688

zeromq-push   | push sent: 1527545191798
zeromq-pull02 | pull connecting: tcp://push:5688

zeromq-push   | push sent: 1527545195802
zeromq-pull01 | pull received: 1527545191798

zeromq-push   | push sent: 1527545199807
zeromq-pull02 | pull received: 1527545195802

zeromq-push   | push sent: 1527545203812
zeromq-pull01 | pull received: 1527545199807

zeromq-push   | push sent: 1527545207816
zeromq-pull02 | pull received: 1527545203812

```


## [License](LICENSE.md)

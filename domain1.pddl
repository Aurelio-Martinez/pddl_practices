(define (domain wumpus1)
  (:requirements :strips)
  (:predicates
   (at ?what ?square)
   (adj ?square-1 ?square-2)
   (pit ?square)
   (wumpus-in ?square)
   (gold-in ?square)
   (have ?who ?what)
   (is-agent ?who)
   (is-wumpus ?who)
   (is-gold ?what)
   (is-arrow ?what))
  (:action move
    :parameters (?from ?to)
    :precondition (and (is-agent agent)
		       (at agent ?from)
		       (adj ?from ?to)
		       (not (pit ?to))
		       (not (wumpus-in ?to)))
    :effect (and (not (at agent ?from))
		 (at agent ?to))
    )

  (:action grab
    :parameters (?where)
    :precondition (and (is-agent agent)
		       (at agent  ?where)
		       (gold-in ?where))
    :effect (and (have agent the-gold)
		 (not (at the-gold ?where)))
    )
  (:action shoot
    :parameters (?where ?victim ?to)
    :precondition (and (is-agent ?who)
		       (have agent the-arrow)
		       (at agent ?where)
		       (at wumpus-in ?to)
		       (adj ?where ?to))
    :effect (and
		 (not (wumpus-in ?to))
		 (not (have ?agent the-arrow)))
    )
)
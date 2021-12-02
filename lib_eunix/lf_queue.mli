(** A lock-free multi-producer, single-consumer, thread-safe queue without support for cancellation.
    This makes a good data structure for a scheduler's run queue. *)

type 'a t
(** A queue of items of type ['a]. *)

exception Closed

val create : unit -> 'a t

val push : 'a t -> 'a -> unit
(** [push t x] adds [x] to the queue.
    @raise Closed if [t] is closed. *)

val pop : 'a t -> 'a option
(** [pop t] removes the head item from [t] and returns it.
    Returns [None] if [t] is currently empty.
    @raise Closed if [t] has been closed. *)

val is_empty : 'a t -> bool

val close : 'a t -> unit
(** [close t] marks [t] as closed, preventing any further items from being pushed. *)

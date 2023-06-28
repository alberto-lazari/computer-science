When put into the broader trustworthy AI horizon, the paper contributions have some interesting improvements over some of the main topics of the subject.

When considering the _Assessment List for Trustworthy AI_ (ALTAI) the greatest improvements can be seen mostly on:
- *Requirement \#1*: Human Agency and Oversight
- *Requirement \#3*: Privacy and Data Governance
- *Requirement \#4*: Transparency

== Privacy and Data Governance
This is another rock-solid assumption in the paper: the model has to be private.
As with interpretability, it proved that a model can have comparable security results, but with great levels of accuracy and still keeping the interpretability.

In this case LLM is not the first model to consider this aspect, nor the best, but a virtuous example that privacy can be treated seriously, without giving up on performance.

== Transparency
This is probably the most important point the paper revolves around.
It starts pointing out that no other model ever considered to find a trade-off between privacy and accuracy, but with the premise that the system should be interpretable and explainable.

When compared with other, already existing models, LLM proved to reach similar results, but with the added feature of being simple and explainable, by design. \
This is a great starting point for modern, next-generation models, that could incorporate such a model, or the philosophy behind it, allowing all new models to be easily understandable.

== Human Agency and Oversight
Being transparent and easily explainable, the LLM model is easier than more obscure alternatives to be managed and supervised by a human.
When talking about oversight especially, being able to explain clearly the reasoning behind specific choices of the AI is important and a great advantage to have.

It is not that easy to intervene and change the AI system manually, though probably possible by tuning the linear maps weights to avoid particular answers (maybe toward bias) or make some classes more precisely identifiable.

== Other requirements
Regarding the other requirements it's difficult to say whether it improves or not.
It mostly depends on actual implementations and real applications.

Topics like diversity, bias, safety or accountability were not addressed by the paper, because they were outside its scope.
The proposal is a generic model, but a simple and clear one, thus it may be able to improve some aspects, given it is used and implemented well.

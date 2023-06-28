== Trade-offs in ML models
The first topic addressed by the paper are trade-offs that arise when modeling machine learning systems. \
There are three key features of an ML model that struggle to coexist:
+ *Interpretability*: is it possible to explain why an ML system gave a specific classification to a specific input?
+ *Privacy*: is it possible to retrieve information about the data the system was trained on, using only the system's output?
+ *Accuracy*: does the system actually work? I.e., are predictions accurate most of the times, with a suitably high probability?

Trying to increase one of these aspects, naturally lowers one of the others:
- increasing privacy may lead to more complex models, with less regular predictions that are more difficult to explain (interpretability) and are less accurate;
- increasing accuracy may reduce privacy, because better performances can probably reveal more about training data, but also make the model much more difficult to explain (neural networks, for instance).

Various works already addressed the trade-off between privacy and accuracy, but no one ever considered interpretability in the variables. Since EU's GDPR (_General Data Protection Regulation_) states that algorithms have to be interpretable and private by design it's important to find a balance between the three variables, otherwise accuracy would have to be sacrificed.

The main topic addressed by the paper is exactly that of finding a model to better equilibrate interpretability, privacy and accuracy in ML systems predictions.

== LLM

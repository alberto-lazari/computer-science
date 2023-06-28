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
To achieve the goal of balancing the trade-off the paper suggests to use a simple and analytical model, satisfying:
#{
  set enum(numbering: "A.")
  [
    + Local _and_ global explanations
    + Low number of parameters, to have a good privacy -- accuracy trade-off
    + Good level of expressiveness to be useful even with complex data
  ]
}

The proposal is to use _Locally Linear Maps_ (LLMs) for such a model.

=== Local and global explanation
Using LLMs allows to provide both local and global predictions explanations.

Various methods are explainable, but only on a local scope: it is possible to explain the classification of a particular input, but not that of an entire class of inputs.
With these methods the only possible way to understand the system as a whole it is necessary to test various inputs to get an idea of how it works on specific classes, but it is not possible only looking at the model itself.

LLMs allow this property instead: when analyzing the output of a specific input it is possible to quickly have a grasp of what lead to a particular classification.

When classifying an input, the model assigns weights to every single linear map.
The wights themselves are a great indicator of the explanation of predictions about a single input, but also about a class as a whole.
In fact, judging by the weight of a linear map it's possible to understand what class that specific linear map is sensible to.

=== Privacy vs accuracy
As stated before, there are various existing methods to get a good trade-off between privacy and accuracy.
As seen in the previous section using LLM it is possible to have a good level of interpretability (both local and global).
Finding a good trade-off between privacy and accuracy means that LLM provides a good trade-off between all the three variables.

/ Differential Privacy: It is important to note that the paper considers privacy in the context of _Differential Privacy_ (DP), which defines the quantity of privacy loss between two datasets that differ in the presence of one element. \ The privacy loss is higher the higher is the probability of revealing the presence of that one element in the dataset, through the system's output.

The _composability_ property of DP states that the composition of DP values degrades the total privacy.
For this reason LLM has to reduce the number of parameters and perturb them to increase privacy, which is done combining two methods:
- *Random projections*: used to reduce the dimension of the input. It allows to have a lower number of linear maps
- *Perturbation*: noise is added to each linear map, at each step of the training

Only adding noise to the output would lead to a great loss in accuracy, this is the reason to also use random projections.

=== Expressiveness

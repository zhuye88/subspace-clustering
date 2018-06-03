These functions implement a subspace clustering algorithm, proposed by Ye Zhu, Kai Ming Ting, and Mark J. Carman: 
"Grouping Points by Shared Subspaces for Effective Subspace Clustering", to appear in Pattern Recognition Journal at https://doi.org/10.1016/j.patcog.2018.05.027

Written by Ye Zhu, Deakin University, 28 March 2018, version 1.0 (ye.zhu@ieee.org).

This software is under GNU General Public License version 3.0 (GPLv3)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Abstract of the paper

Clusters may exist in different subspaces of a multidimensional dataset. Traditional full-space clustering algorithms have difficulty in identifying these clusters. Various subspace clustering algorithms have used different subspace search strategies. They require clustering to assess whether cluster(s) exist in a subspace. In addition, all of them perform clustering by measuring similarity between points in the given feature space. As a result, the subspace selection and clustering processes are tightly coupled. In this paper, we propose a new subspace clustering framework named CSSub (Clustering by Shared Subspaces). It enables neighbouring core points to be clustered based on the number of subspaces they share. It explicitly splits candidate subspace selection and clustering  into two separate processes, enabling different types of cluster definitions to be employed easily. Through extensive experiments on synthetic and real-world datasets, we demonstrate that CSSub discovers non-redundant subspace clusters with arbitrary shapes in noisy data; and it significantly outperforms existing state-of-the-art subspace clustering algorithms.

 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

References:  

[1] Ester, M., Kriegel, H. P., Sander, J., & Xu, X. (1996, August). A density-based algorithm for discovering clusters in large spatial databases with noise. In Kdd (Vol. 96, No. 34, pp. 226-231).

[2] Liu, F. T., Ting, K. M., & Zhou, Z. H. (2012). Isolation-based anomaly detection. ACM Transactions on Knowledge Discovery from Data (TKDD), 6(1), 3.

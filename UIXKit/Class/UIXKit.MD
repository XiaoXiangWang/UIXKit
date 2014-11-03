#Introduction
######[V:1.0]
UIXKit指在完成一套工作中常用的UI框架.
######[V:1.1]
在1.1版本中修复部分逻辑问题，以及结构性修改
#Class map
######1.0版本类图
> UIXKit
  >> UIXKitDefines

  >> UIXViewController

    >>> UIXTableViewController

      >>>> UIXLMTableViewController

    >>> UIXCollectionViewController

      >>>> UIXLMCollectionViewController

  >> UIView(Apple)

    >>> UIControl(Apple)

      >>>> UIXRefreshControl

      >>>> UIXLoadMoreControl

    >>> UIXLoadMoreView

    >>> UIXActivityIndicatorView

    >>> UIXCircleProgressView

      >>>> UIXRefreshCircleProgressView

######1.1版本类图

> UIXKit

  >> UIXKitDefines

  >> UIXViewController(by Apple)

    >>> UIXViewController

      >>>> UIXTableViewController

        >>>>> UIXLMTableViewController

      >>>> UIXCollectionViewController

        >>>>> UIXLMCollectionViewController

  >> UIView(by Apple)

    >>> UIControl(by Apple)

      >>>> UIXAbstractRefreshControl(Abstract Class)

        >>>>> UIXPullDownControl

        >>>>> UIXPullUpControl

    >>> UIXLoadMoreView

    >>> UIXActivityIndicatorView

    >>> UIXAbstractProgressView(Abstract Class)

      >>>> UIXProgressView

      >>>> UIXCircleProgressView

        >>>>> UIXRefreshCircleProgressView

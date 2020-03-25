using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;

namespace CoreHelper
{
    /// <summary>
    /// image帮助类
    /// </summary>
    public static class ImageHelper
    {
        /// <summary>
        /// 适配缩量尺寸
        /// </summary>
        /// <param name="spcWidth"></param>
        /// <param name="spcHeight"></param>
        /// <param name="orgWidth"></param>
        /// <param name="orgHeight"></param>
        /// <returns></returns>
        public static Size AdjustSize(int spcWidth, int spcHeight, int orgWidth, int orgHeight)
        {
            Size size = new Size();
            // 原始宽高在指定宽高范围内，不作任何处理 
            if (orgWidth <= spcWidth && orgHeight <= spcHeight)
            {
                size.Width = orgWidth;
                size.Height = orgHeight;
            }
            else
            {
                // 取得比例系数 
                float w = orgWidth / (float)spcWidth;
                float h = orgHeight / (float)spcHeight;
                // 宽度比大于高度比 
                if (w > h)
                {
                    size.Width = spcWidth;
                    size.Height = (int)(w >= 1 ? Math.Round(orgHeight / w) : Math.Round(orgHeight * w));
                }
                // 宽度比小于高度比 
                else if (w < h)
                {
                    size.Height = spcHeight;
                    size.Width = (int)(h >= 1 ? Math.Round(orgWidth / h) : Math.Round(orgWidth * h));
                }
                // 宽度比等于高度比 
                else
                {
                    size.Width = spcWidth;
                    size.Height = spcHeight;
                }
            }
            return size;
        }

        /// <summary>
        /// 获取缩略图
        /// </summary>
        /// <param name="image"></param>
        /// <param name="spcWidth"></param>
        /// <param name="spcHeight"></param>
        /// <param name="adjust"></param>
        /// <returns></returns>
        public static Image GetThumbnailImage(this Image image, int spcWidth, int spcHeight, bool adjust = true)
        {
            if (spcWidth == 0) spcWidth = image.Width;
            if (spcHeight == 0) spcHeight = image.Height;
            if (adjust)
            {
                var size = AdjustSize(spcWidth, spcHeight, image.Width, image.Height);
                //return image.GetThumbnailImage(size.Width, size.Height, () => false, IntPtr.Zero);
                return GetReducedImage(size.Width, size.Height, image);
            }
            else
            {
                //return image.GetThumbnailImage(spcWidth, spcHeight, () => false, IntPtr.Zero);
                return GetReducedImage(spcWidth, spcHeight, image);
            }
        }
        /// <summary>
        /// 从base64获取图片
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public static Image FromBase64(string value)
        {
            byte[] buffer = Convert.FromBase64String(value);
            using (MemoryStream ms = new MemoryStream(buffer))
            using (var image = Image.FromStream(ms))
            {
                return new Bitmap(image);
            }
        }



        /// <summary>
        /// 按照指定的高和宽生成相应的规格的图片，采用此方法生成的缩略图片不会失真
        /// </summary>
        /// <param name="width">指定宽度</param>
        /// <param name="height">指定高度</param>
        /// <param name="imageFrom">原图片</param>
        /// <returns>返回新生成的图</returns>
        public static Image GetReducedImage(int width, int height, Image imageFrom)
        {
            // 源图宽度及高度 
            int imageFromWidth = imageFrom.Width;
            int imageFromHeight = imageFrom.Height;

            // 生成的缩略图在上述"画布"上的位置
            int X = 0;
            int Y = 0;

            // 创建画布
            Bitmap bmp = new Bitmap(width, height, PixelFormat.Format24bppRgb);
            bmp.SetResolution(imageFrom.HorizontalResolution, imageFrom.VerticalResolution);
            using (Graphics g = Graphics.FromImage(bmp))
            {
                // 用白色清空 
                g.Clear(Color.Transparent);

                // 指定高质量的双三次插值法。执行预筛选以确保高质量的收缩。此模式可产生质量最高的转换图像。 
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.CompositingQuality = CompositingQuality.HighQuality;
                // 指定高质量、低速度呈现。 
                g.SmoothingMode = SmoothingMode.HighQuality;
                g.PixelOffsetMode = PixelOffsetMode.HighQuality;

                // 在指定位置并且按指定大小绘制指定的 Image 的指定部分。 
                g.DrawImage(imageFrom, new Rectangle(X, Y, width, height),
                    new Rectangle(0, 0, imageFromWidth, imageFromHeight), GraphicsUnit.Pixel);

                //将图片以指定的格式保存到到指定的位置
                return bmp;
            }
        }
    }
}
